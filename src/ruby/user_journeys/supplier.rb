SUPPLIER_DEFINITIONS = """
e=>end:>
"""

SUPPLIER_UJS = [
  { title: "One",
    logic: """
st=>start: /content/cat:>
#{ SUPPLIER_DEFINITIONS }

st->e
    """
  }
]