ADMIN_DEFINITIONS = """
e=>end:>
"""

ADMIN_UJS = [
  { title: "One",
    logic: """
st=>start: /content/cat:>
#{ ADMIN_DEFINITIONS }

st->e
    """
  }
]