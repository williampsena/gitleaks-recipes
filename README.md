# 🔐 Gitleaks Configuration Examples

This repository provides example configurations for [Gitleaks](https://github.com/gitleaks/gitleaks), a tool for detecting hardcoded secrets like API keys, passwords, and other sensitive data in your codebase.

# Setup pre-commit

If you want a scan after each commit, configure your pre-commit with pure bash 👾 using the following command:

```shell
ln -sf $(pwd)/pre-commit $(pwd)/.git/hooks/pre-commit
```

> However, if you want something more comprehensive, you can use [Husky](https://typicode.github.io/husky/) or [pre-commit](https://pre-commit.com/).

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

# How do I fake a failure using scan?

Copy the following values into your `.env.sample`:

<script src="https://gist.github.com/williampsena/4154be8db8c59a992acf746420765dcc.js"></script>

