# yugen-ash highlight showcase — Dockerfile
#
# Open with the theme:
#   nvim -u tests/minimal_init.lua tests/fixtures/langs/Dockerfile
#   YUGEN_ASH_VARIANT=light nvim -u tests/minimal_init.lua tests/fixtures/langs/Dockerfile
#
# Headless coverage check:
#   scripts/test-highlights.sh dockerfile
#
# Debug: :Inspect, :InspectTree, :YugenAshInspect, :hi <group>

# legacy syntax: dockerfileComment
# Treesitter: @comment
ARG BASE_IMAGE=alpine:3.20
FROM ${BASE_IMAGE} AS build

# legacy syntax: dockerfileFroms, dockerfileKeyword, dockerfileInstruction
# legacy syntax: dockerfileTag, dockerfileOption
# Treesitter: @keyword, @string, @variable, @operator

LABEL org.opencontainers.image.title="yugen-ash showcase" \
      org.opencontainers.image.version="1.0"

# legacy syntax: dockerfileEnv, dockerfileString
# Treesitter: @property, @constant, @string
ENV APP_HOME=/app \
    APP_ENV=production \
    APP_DEBUG=false

# legacy syntax: dockerfileShell, dockerfileBytes
# Treesitter: @function, @punctuation.special, @constant
RUN apk add --no-cache curl bash \
    && mkdir -p ${APP_HOME} \
    && echo "build: $APP_ENV"

# legacy syntax: dockerfileFirst
WORKDIR ${APP_HOME}

COPY --chown=app:app package.json ./
ADD https://example.com/tool.tar.gz /tmp/tool.tar.gz

RUN chmod +x /tmp/tool.tar.gz

EXPOSE 8080/tcp
VOLUME ["/data"]
USER app

HEALTHCHECK --interval=30s --timeout=3s CMD curl -f http://localhost:8080/health || exit 1

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["serve", "--debug", "false"]
