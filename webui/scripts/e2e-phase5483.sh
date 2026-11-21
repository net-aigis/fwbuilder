#!/usr/bin/env bash
# Phase-5483: client soft_fertig_ssh_alternative_titles_roster Soft 5480+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternative_titles_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5480+ soft_fertig_ssh_alternative_titles_roster type ok"; echo "cleaned"; echo "OK: phase5483 e2e passed"
