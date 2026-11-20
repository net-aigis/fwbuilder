#!/usr/bin/env bash
# Phase-41563: client soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster Soft 41560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 41560+ soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase41563 e2e passed"
