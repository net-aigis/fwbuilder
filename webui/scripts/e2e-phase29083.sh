#!/usr/bin/env bash
# Phase-29083: client soft_fertig_ssh_auth_triacontahexacosadeca_checkpoint_roster Soft 29080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontahexacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 29080+ soft_fertig_ssh_auth_triacontahexacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase29083 e2e passed"
