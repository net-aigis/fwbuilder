# Publishing a package repository

Local build scripts produce artifacts under `dist/`. This document turns them into
a **static apt + rpm repo** you can host on GitHub Pages, nginx, or an object store.

Official OBS/COPR/PPA accounts are optional next steps; the static repo works today.

## 1) Build packages

```bash
bash webui/scripts/package-webui.sh
bash webui/scripts/package-webui-rpm.sh
bash webui/scripts/package-webui-deb.sh
```

## 2) Generate repo metadata

```bash
bash webui/scripts/publish-static-repo.sh
# → dist/repo/{rpm,apt,tarball}/ + dist/repo/README.md
```

## 3) Host

Upload `dist/repo/` to any HTTPS origin, e.g.:

- GitHub Pages (`docs/` or `gh-pages` branch)
- `rsync -a dist/repo/ user@host:/var/www/fwbuilder-webui/`

Then point clients at that URL (see snippets in `dist/repo/README.md`).

### RPM (openSUSE / Fedora)

```ini
[fwbuilder-webui]
name=Firewall Builder WebUI
baseurl=https://YOUR.HOST/repo/rpm
enabled=1
gpgcheck=0
```

### APT (Debian / Ubuntu)

```text
deb [trusted=yes] https://YOUR.HOST/repo/apt stable main
```

(`trusted=yes` skips GPG until you add signing; for public mirrors, add a signing key later.)

## 4) Optional: GitHub Release attach

Release tags already attach `.tar.gz` / `.rpm` / `.deb`. The static repo is for
`zypper`/`apt` consumers who want a refreshable channel.
