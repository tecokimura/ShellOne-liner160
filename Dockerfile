# https://rooter.jp/infra-ops/build_docker_jp_env/

# Ubuntuの20.04の最小イメージから構築
# まっさらな状態からの場合はscratchとする
FROM ubuntu:20.04

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# パッケージリストを更新
RUN apt-get update -y
# 日本語化パッケージリストをインストール
RUN apt-get install -y language-pack-ja-base language-pack-ja locales
# localeを日本語設定に変更
RUN locale-gen ja_JP.UTF-8
# 言語を日本語に設定
ENV LANG ja_JP.UTF-8

# One-liner用のインストール
RUN apt-get install -y manpages-ja manpages-ja-dev
RUN apt-get install -y bc ruby num-utils
RUN apt-get install -y gawk
