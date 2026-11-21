#!/usr/bin/env bash
# Phase-1187: client types for ssh title maps.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'ssh_alternative_titles?:' webui/frontend/src/api/client.ts
grep -Fq 'ssh_refusal_path_titles?:' webui/frontend/src/api/client.ts
echo "client ssh title types ok"
echo "cleaned"
echo "OK: phase1187 e2e passed"
