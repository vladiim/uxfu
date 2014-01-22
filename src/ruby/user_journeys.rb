USER_ONE_UJ = [ 
  { title: "First user journey",
    logic: """
st=>start: Legend form field visible:>http://www.google.com[blank]
e=>end:>
e2=>end:>
entersTalent=>condition: Enters talent
passesValidation=>condition: Passes validation
nameForm=>operation: Name form with prompt
val=>end: Validation message
entersName=>condition: Enters name
passesVal=>condition: Passes validation
uj2=>inputoutput: UJ#2 Animation sequence

st->entersTalent
entersTalent(yes, right)->passesValidation
entersTalent(no)->e
passesValidation(yes, right)->nameForm->entersName
passesValidation(no)->val
entersName(yes, right)->passesVal
entersName(no)->e2
passesVal(yes, up)->uj2
passesVal(no)->e2
    """
   },
  { title: "2nd UJ",
    logic: """
st=>start: Legend form field visible:>http://www.google.com[blank]
e=>end:>
e2=>end:>
entersTalent=>condition: Enters talent
passesValidation=>condition: Passes validation
nameForm=>operation: Name form with prompt
val=>end: Validation message
entersName=>condition: Enters name
passesVal=>condition: Passes validation
uj2=>inputoutput: UJ#2 Animation sequence

st->entersTalent
entersTalent(yes, right)->passesValidation
entersTalent(no)->e
passesValidation(yes, right)->nameForm->entersName
passesValidation(no)->val
entersName(yes, right)->passesVal
entersName(no)->e2
passesVal(yes, up)->uj2
passesVal(no)->e2
    """
  }
]

USER_JOURNEYS = [ { name: "Visitor", ujs: USER_ONE_UJ } ]