# Publishing a package repository

## Live repo (GitHub Pages)

**Base:** https://net-aigis.github.io/fwbuilder/

### RPM (openSUSE / Fedora)

```bash
curl -fsSL https://net-aigis.github.io/fwbuilder/rpm/fwbuilder-webui.repo \
  | sudo tee /etc/zypp/repos.d/fwbuilder-webui.repo
# Fedora/RHEL: /etc/yum.repos.d/fwbuilder-webui.repo
sudo zypper refresh && sudo zypper install fwbuilder-webui
```

### APT (Debian / Ubuntu)

```bash
curl -fsSL https://net-aigis.github.io/fwbuilder/apt/fwbuilder-webui.list \
  | sudo tee /etc/apt/sources.list.d/fwbuilder-webui.list
sudo apt update && sudo apt install fwbuilder-webui
```

Rebuild & republish after new packages:

```bash
bash webui/scripts/package-webui.sh
bash webui/scripts/package-webui-rpm.sh
bash webui/scripts/package-webui-deb.sh
bash webui/scripts/publish-static-repo.sh
bash webui/scripts/publish-github-pages-repo.sh
```

## Local static tree

`publish-static-repo.sh` writes `dist/repo/` (apt + rpm metadata) for any host.
See also GitHub Release assets for one-off `.rpm` / `.deb` / `.tar.gz` downloads.

Official OBS/COPR/PPA accounts are optional; GitHub Pages is the supported channel.
