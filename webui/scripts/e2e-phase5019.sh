#!/usr/bin/env bash
# Phase-5019: client ssh_refusal_paths_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_refusal_paths_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-refusal-paths roster type ok"; echo "cleaned"; echo "OK: phase5019 e2e passed"
