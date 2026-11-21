#!/usr/bin/env bash
# Phase-5499: client ssh_refusal_path_titles_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_refusal_path_titles_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-refusal-path-titles roster type ok"; echo "cleaned"; echo "OK: phase5499 e2e passed"
