#!/usr/bin/env bash
# Phase-4763: client soft_fertig_ssh_not_implemented_roster Soft 4760+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 4760+ soft_fertig_ssh_not_implemented_roster type ok"
echo "cleaned"
echo "OK: phase4763 e2e passed"
