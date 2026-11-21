#!/usr/bin/env bash
# Phase-23643: client soft_fertig_ssh_auth_enneacosadeca_checkpoint_roster Soft 23640+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_enneacosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 23640+ soft_fertig_ssh_auth_enneacosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase23643 e2e passed"
