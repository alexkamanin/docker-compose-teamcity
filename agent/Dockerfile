FROM --platform=linux/amd64 jetbrains/teamcity-agent

# Install java SDK

ARG JDK_VERSION
ARG JDK_URL
ARG JDK_SHA256SUM

ENV JAVA_HOME /usr/lib/jvm/jdk-${JDK_VERSION}
ENV JDK_HOME /usr/lib/jvm/jdk-${JDK_VERSION}

USER root

RUN mkdir -p ${JAVA_HOME} && \
    chown -R buildagent:buildagent ${JAVA_HOME}

USER buildagent

RUN cd ${JAVA_HOME} && \
    curl -L ${JDK_URL} -o amazon-corretto.tar.gz && \
    echo "${JDK_SHA256SUM} *amazon-corretto.tar.gz" | shasum -a 256 -c && \
    tar -xzvf amazon-corretto.tar.gz --strip-components=1 && \
    rm -rf amazon-corretto.tar.gz

# Install android command line tools

ARG ANDROID_CLT_URL

ENV ANDROID_HOME /opt/android

USER root

RUN mkdir -p ${ANDROID_HOME}/cmdline-tools/tools && \
    chown -R buildagent:buildagent ${ANDROID_HOME}

USER buildagent

RUN cd ${ANDROID_HOME} && \
    curl -L ${ANDROID_CLT_URL} -o android_tools.zip && \
    unzip android_tools.zip && \
    rm android_tools.zip && \
    cd ${ANDROID_HOME}/cmdline-tools && \
    mv NOTICE.txt source.properties bin lib tools/

ENV PATH ${PATH}:${ANDROID_HOME}/cmdline-tools/tools/bin:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

RUN yes | sdkmanager --licenses

# Install android platform and build tools

ARG ANDROID_PLATFORM_VERSION
ARG ANDROID_BUILD_TOOLS_VERSION

RUN sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}"
RUN sdkmanager "platform-tools"
RUN sdkmanager "platforms;android-${ANDROID_PLATFORM_VERSION}"

RUN yes | sdkmanager --licenses