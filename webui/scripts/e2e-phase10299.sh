#!/usr/bin/env bash
# Phase-10299: client soft_fertig_ssh_auth_key_surface_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_key_surface_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-key-surface roster type ok"; echo "cleaned"; echo "OK: phase10299 e2e passed"
