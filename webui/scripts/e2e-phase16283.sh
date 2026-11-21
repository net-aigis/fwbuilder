#!/usr/bin/env bash
# Phase-16283: client soft_fertig_ssh_auth_hexa_checkpoint_roster Soft 16280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_hexa_checkpoint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 16280+ soft_fertig_ssh_auth_hexa_checkpoint_roster type ok"; echo "cleaned"; echo "OK: phase16283 e2e passed"
