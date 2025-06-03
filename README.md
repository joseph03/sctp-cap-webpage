# 🛡️ cap-webpage — `ce-grp-3a` e-commerce website

This is the website used in the [`ce-grp-3a` e-commerce website project](http://ce-grp-3a-my-app2.sctp-sandbox.com/). 

This project provides a simple e-commerce frontend served by Nginx, with a button to interact with a fraud detection API. The frontend is containerized using Docker and is designed to be deployed in a Kubernetes environment.

---

## 📦 Features
Static Frontend: Serves a static HTML page (index.html) for user interaction.

Fraud Detection API Integration: The frontend can send user input to the fraud detection service via a POST request to /api/detect.

Proxy Configuration: Nginx is configured to proxy /api/detect requests to a Kubernetes service (fraud-detection.ns-app.svc.cluster.local:4000).

---

## 🚀 Getting Started (Local)

### build and push image to your docker hub
docker build -t '<dockerhub-username>'/frontend-static-7766:v1.0.10 .

docker push '<dockerhub-username>'/frontend-static-7766:v1.0.10 .

A new version has to be used everytime the image is updated. eg. v1.0.11

### effect the image for deployment 
Update the version number (eg. v.1.0.10) in previous step to deployment.yaml that cloned from sctp-cap-webCD repo

then git push to sctp-cap-webCD repo and perform
argocd app sync my-app2  --prune
so that Argocd server can run image v1.0.10 in http://ce-grp-3a-my-app2.sctp-sandbox.com/
 