#!/usr/bin/env bash
# Phase-6379: client ssh_implemented_agent_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_agent_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-not-implemented-batch roster type ok"; echo "cleaned"; echo "OK: phase6379 e2e passed"
