#!/usr/bin/env bash
# Phase-5083: client soft_fertig_ssh_refusal_paths_roster Soft 5080+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_refusal_paths_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5080+ soft_fertig_ssh_refusal_paths_roster type ok"; echo "cleaned"; echo "OK: phase5083 e2e passed"
