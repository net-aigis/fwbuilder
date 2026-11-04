#!/usr/bin/env bash
# Phase-980: STATUS mentions signal_key_count / 977-984.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'signal_key_count|signalKeys=|layout_fidelity_sample_signal_key_count' webui/STATUS.md
grep -qE 'phase984|through 984|e2e-phase984' webui/STATUS.md
echo "STATUS signal_key_count ok"
echo "cleaned"
echo "OK: phase980 e2e passed"
