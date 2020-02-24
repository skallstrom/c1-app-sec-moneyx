# app-protect-moneyx
Sample Java Spring application for Cloud One Application Security demos, build and deployable to kubernetes with Jenkins.

## Detailed Description
This is a sample, vulnerable-on-purpose, Java Spring application that can be used to demo Cloud One Application Security.

MoneyX was created by the fine folks over at nVisium.

See:  https://github.com/nVisium/MoneyX

## Pre-Requisites for Usage

* Docker
* A Cloud One Application Security account

### Usage Instructions (to be updated)

1. Download and run the container:
```
docker run --rm -d -p 8080:8080 --name moneyx-app-protect -e TREND_AP_KEY=<KEY> -e TREND_AP_SECRET=<SECRET> howiehowerton/moneyx-app-protect
```
Note: To obtain your Key and Secret, you'll need to:
* Log into your Cloud One Application Security account
* Add a new group
* Copy your Key and Secret

The Cloud One Application Security library (which is ADDed via the Dockerfile) uses the Key and Secret to identify the group to which the application belongs.

2. Follow the instructions in [exploits.md](exploits.md) to exploit the application.  Demonstrate that the exploits work against the vulnerable app.

3. Switch Cloud One Application Security rules from "Report" to "Mitigate".

4. Follow the instructions in [exploits.md](exploits.md) again. Demonstrate that the exploits **no longer** work.
