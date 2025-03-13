# NastyContainer

**NastyContainer** is a deliberately malicious container designed for security research, detection testing, and response exercises. It includes various security threats to simulate real-world attack scenarios in a controlled environment.

## 🚨 WARNING: FOR SECURITY RESEARCH PURPOSES ONLY 🚨

This container is built purely for cybersecurity training and research. Running it on production systems or outside a safe lab environment may lead to unintended security risks.

## Features

- **Suspicious ELF Binary**: A compiled ELF executable demonstrating potentially malicious behavior.
- **Privilege Escalation Attempt**: A technique attempting to elevate privileges within the container.
- **Basic Malware Techniques**: Various suspicious activities that could be used in real-world attacks.
- **Network Enumeration Tools**: Pre-installed utilities like `nmap`, `ncat`, and `tcpdump` for scanning and reconnaissance.

## 🚀 Usage

### 🐳 Pull the Image

```sh
docker pull bajacloud/nastycontainer:latest
```

### 🏗 Run the Container

```sh
docker run --rm -it bajacloud/nastycontainer
```

### 🛠 Kubernetes Deployment

If you want to deploy this container on Kubernetes, you can use the sample manifests available in the `K8s-manifests/` directory.

```sh
kubectl apply -f K8s-manifests/deployment.yaml
```

## 🕵️‍♂️ Security Considerations

- Run this container in an **isolated** environment (e.g., local VM, sandboxed Kubernetes cluster).
- **Do not** expose this container to the internet or sensitive environments.
- Monitor logs and container behavior using security tools.

## 📜 License

This project is intended for **educational and research purposes only**. Use it responsibly.

---

💡 **Disclaimer:** The author is not responsible for any misuse of this container. Always conduct security research ethically and within legal boundaries.
