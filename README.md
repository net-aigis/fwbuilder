# Firewall Builder WebUI — live package repo

**Base URL:** https://net-aigis.github.io/fwbuilder

## RPM

```bash
curl -fsSL https://net-aigis.github.io/fwbuilder/rpm/fwbuilder-webui.repo \
  | sudo tee /etc/zypp/repos.d/fwbuilder-webui.repo
sudo zypper refresh && sudo zypper install fwbuilder-webui
```

## APT

```bash
curl -fsSL https://net-aigis.github.io/fwbuilder/apt/fwbuilder-webui.list \
  | sudo tee /etc/apt/sources.list.d/fwbuilder-webui.list
sudo apt update && sudo apt install fwbuilder-webui
```

Source: [net-aigis/fwbuilder](https://github.com/net-aigis/fwbuilder)
