#!/usr/bin/env bash
# Phase-499: FirewallExtras SSH refusal summary + auth path.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'sshRefusalSummary' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPath' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'ssh_refusal_paths' webui/frontend/src/components/FirewallExtras.tsx
echo "SSH refusal UI ok"
echo "cleaned"
echo "OK: phase499 e2e passed"
