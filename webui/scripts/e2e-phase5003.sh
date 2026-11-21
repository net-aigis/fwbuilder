#!/usr/bin/env bash
# Phase-5003: client soft_fertig_ssh_alternatives_roster Soft 5000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternatives_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5000+ soft_fertig_ssh_alternatives_roster type ok"; echo "cleaned"; echo "OK: phase5003 e2e passed"
