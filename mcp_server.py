# server.py
# from fastmcp import FastMCP
# from mcp.server.fastmcp import FastMCP
# from mcp.server.mcpserver import MCPServer

# from mcp.server import MCPServer
from mcp.server.fastmcp import FastMCP

# 1. 고수준 MCP 서버 인스턴스 생성
# mcp = MCPServer("DemoServer")

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


# @mcp.tool()
# async def my_tool(param: str) -> str:
#     return f"Hello, {param}"

# # Let the CLI or environment handle the transport instead of hardcoding stdio
# if __name__ == "__main__":
#     mcp.run() 