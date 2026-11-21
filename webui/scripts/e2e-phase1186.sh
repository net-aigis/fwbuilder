#!/usr/bin/env bash
# Phase-1186: UI ssh alt titles bit.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'ssh_alternative_titles' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAlternativeTitles' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh alt titles ok"
echo "cleaned"
echo "OK: phase1186 e2e passed"
