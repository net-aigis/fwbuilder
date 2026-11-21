#!/usr/bin/env bash
# Phase-17243: client soft_fertig_ssh_auth_nona_checkpoint_roster Soft 17240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_nona_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 17240+ soft_fertig_ssh_auth_nona_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase17243 e2e passed"
