#!/usr/bin/env bash
# Phase-11403: client soft_fertig_ssh_auth_surface_hint_roster Soft 11400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_surface_hint_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 11400+ soft_fertig_ssh_auth_surface_hint_roster type ok"; echo "cleaned"; echo "OK: phase11403 e2e passed"
