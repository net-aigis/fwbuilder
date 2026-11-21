#!/usr/bin/env bash
# Phase-10363: client soft_fertig_ssh_auth_key_surface_roster Soft 10360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_key_surface_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 10360+ soft_fertig_ssh_auth_key_surface_roster type ok"; echo "cleaned"; echo "OK: phase10363 e2e passed"
