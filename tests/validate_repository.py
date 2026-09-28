import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]

def test_main_bicep_exists():
    assert (ROOT / "infrastructure" / "main.bicep").exists()

def test_guardrails_documented():
    text = (ROOT / "governance" / "guardrails.md").read_text(encoding="utf-8")
    for heading in ("Identity", "Networking", "Security", "Management", "Cost"):
        assert f"## {heading}" in text

def test_tagging_standard_includes_core_tags():
    text = (ROOT / "governance" / "tagging-standard.md").read_text(encoding="utf-8")
    for tag in ("environment", "owner", "workload"):
        assert tag in text
