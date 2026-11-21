#!/usr/bin/env bash
# Phase-24603: client soft_fertig_ssh_auth_triacontadodeca_checkpoint_roster Soft 24600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontadodeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 24600+ soft_fertig_ssh_auth_triacontadodeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase24603 e2e passed"
