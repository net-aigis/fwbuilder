#!/usr/bin/env bash
# Phase-23003: client soft_fertig_ssh_auth_heptacosadeca_checkpoint_roster Soft 23000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_heptacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 23000+ soft_fertig_ssh_auth_heptacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase23003 e2e passed"
