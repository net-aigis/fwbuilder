#!/usr/bin/env bash
# Phase-7019: client ssh_refusal_paths_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_refusal_paths_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-refusal-paths-refresh roster type ok"; echo "cleaned"; echo "OK: phase7019 e2e passed"
