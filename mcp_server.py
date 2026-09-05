# server.py
from fastmcp import FastMCP

# MCP 서버 초기화
mcp = FastMCP("My Python MCP Server")

@mcp.tool()
def add_numbers(a: int, b: int) -> int:
    """두 정수를 더하는 도구입니다."""
    return a + b

@mcp.tool()
def reverse_text(text: str) -> str:
    """입력받은 문자열을 거꾸로 뒤집는 도구입니다."""
    return text[::-1]