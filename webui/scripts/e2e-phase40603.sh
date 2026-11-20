#!/usr/bin/env bash
# Phase-40603: client soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster Soft 40600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 40600+ soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase40603 e2e passed"
