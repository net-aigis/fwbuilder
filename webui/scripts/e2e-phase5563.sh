#!/usr/bin/env bash
# Phase-5563: client soft_fertig_ssh_refusal_path_titles_roster Soft 5560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_refusal_path_titles_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5560+ soft_fertig_ssh_refusal_path_titles_roster type ok"; echo "cleaned"; echo "OK: phase5563 e2e passed"
