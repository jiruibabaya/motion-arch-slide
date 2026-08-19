"""Capture README hero screenshot from a slide HTML file."""
from pathlib import Path

from playwright.sync_api import sync_playwright

ROOT = Path(__file__).resolve().parents[1]
SLIDE = ROOT / "slides" / "deepseek-harness-v3.html"
OUT = ROOT / "assets" / "preview.png"


def main() -> None:
    OUT.parent.mkdir(parents=True, exist_ok=True)
    url = SLIDE.as_uri()
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page(viewport={"width": 1920, "height": 1080})
        page.goto(url, wait_until="networkidle")
        page.wait_for_timeout(1200)
        page.screenshot(path=str(OUT), type="png")
        browser.close()
    print(f"Saved {OUT}")


if __name__ == "__main__":
    main()
