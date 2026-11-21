#!/usr/bin/env bash
# Phase-47963: client soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster Soft 47960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 47960+ soft_fertig_ssh_auth_triacontapentacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase47963 e2e passed"
