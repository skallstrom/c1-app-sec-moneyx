FROM frekele/gradle:2.4-jdk8

RUN printf "deb http://archive.debian.org/debian/ jessie main\ndeb http://security.debian.org jessie/updates main" > /etc/apt/sources.list

RUN apt-get update && apt-get install -y --force-yes --no-install-recommends git && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

RUN git clone --depth=1 https://github.com/nVisium/MoneyX.git .

RUN gradle bootRepackage

ADD https://files.trendmicro.com/products/CloudOne/ApplicationSecurity/1.0/trend_app_protect-4.1.2.jar trend_app_protect-4.1.2.jar

EXPOSE 8080

CMD java -javaagent:trend_app_protect-4.1.2.jar -jar build/libs/moneyx.jar

ENV TREND_AP_LOG_FILE=STDERR
