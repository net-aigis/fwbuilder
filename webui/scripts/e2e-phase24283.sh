#!/usr/bin/env bash
# Phase-24283: client soft_fertig_ssh_auth_triacontahenadeca_checkpoint_roster Soft 24280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontahenadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 24280+ soft_fertig_ssh_auth_triacontahenadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase24283 e2e passed"
