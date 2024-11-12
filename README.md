# 🔐 Gitleaks Configuration Examples

This repository provides example configurations for [Gitleaks](https://github.com/gitleaks/gitleaks), a tool for detecting hardcoded secrets like API keys, passwords, and other sensitive data in your codebase.

# 🏃 How to run directory mode

To run a basic scan using the leaks target, use the following command:

```shell
make leaks
```


# 🏃💨 How to run git mode

To run a basic scan using the leaks target, use the following command:

```shell
make leaks-history
```


# 📜 Expected Output

Once the command runs, you should see output similar to the following:

```txt
INF scan completed in 2.56ms
WRN leaks found: 1
Finding:     MY_WEAK_PASSWORD=XXX
Secret:      XXX
RuleID:      generic-api-key
Entropy:     4.452819
File:        /repo/.env
Line:        1
Fingerprint: /repo/.env:generic-api-key:1
```