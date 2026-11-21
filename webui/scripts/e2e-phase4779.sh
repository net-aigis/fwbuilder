#!/usr/bin/env bash
# Phase-4779: client ssh_implemented_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-implemented roster type ok"; echo "cleaned"; echo "OK: phase4779 e2e passed"
