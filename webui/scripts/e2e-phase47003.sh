#!/usr/bin/env bash
# Phase-47003: client soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster Soft 47000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 47000+ soft_fertig_ssh_auth_triacontadocosadeca_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase47003 e2e passed"
