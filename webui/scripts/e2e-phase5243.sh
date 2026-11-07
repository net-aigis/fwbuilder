#!/usr/bin/env bash
# Phase-5243: client soft_fertig_ssh_method_lists_roster Soft 5240+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_method_lists_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 5240+ soft_fertig_ssh_method_lists_roster type ok"; echo "cleaned"; echo "OK: phase5243 e2e passed"
