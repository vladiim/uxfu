VISITOR_DEFINITIONS = """
e=>end:>
e2=>end:>
addComment=>condition: Add comment
addLink=>condition: Add link to Look Book
addFriendsEmail=>condition: Manually add friend's email
addsToLookBook=>condition: Adds to Look Book
addedToXLookBooks=>condition: Added to (X) Look Books
alreadyAUser=>condition: Already a user
askFriendsToComment=>condition: Ask friends to comment
clicksContentItem=>condition: Clicks content item
clicksContentCategory=>condition: Clicks content category
clicksContent=>condition: Clicks content
clickForgotDetails=>condition: Click forgot details
clicksImage=>condition: Clicks image
clicksInspNav=>condition: Clicks inspiration nav
clickSignUp=>condition: Click sign up
clicksVote=>condition: Click vote
contactsSupplier=>condition: Contacts supplier
commentAccepted=>inputoutput: Comment accepted
copyLookBook=>condition: Copy Look Book
editDetails=>condition: Edit details (theme, budget etc)
emailMessage=>operation: Writes & submits message + email
fillInDetails=>operation: Fill in details
finishesContent=>condition: Finishes content
forgotDetailsForm=>inputoutput: #UJ Forgot Details Form
friendsInvited=>inputoutput: #UJ Friends Invited
importedContacts=>condition: Imported contacts (GMail, Facebook etc)
interactsWithComments=>condition: Interacts with comments
itemsRemoved=>inputoutput: Items removed
invitedToJoinLookBook=>inputoutput: #UJ Invited to Join Look Book
linkAdded=>inputoutput: Link added
loggedIn=>condition: Logged in
loggedIn2=>condition: Logged in
logInForm=>inputoutput: #UJ Log in
logInForm2=>inputoutput: #UJ Log in
lookBookCopied=>operation: Look Book copied
lookBookRepopulated=>inputoutput: Look Book repopulated
messageSent=>operation: Message Sent to Supplier
messageSent2=>operation: Message Sent to Supplier
moreContentLoaded=>operation: More content loaded
navigateThroughImages=>condition: Navigate through images
passValidation=>condition: Pass validation
phoneNumberShown=>operation: Phone # shown
readsContent=>condition: Reads content
removeItems=>condition: Remove items
requestsPhoneNumber=>condition: Requests phone #
scrollsDown=>condition: Scrolls down
seeSimilarLookBooks=>condition: See similar look books
selectOneOrMoreFriends=>condition: Select one or more friends
sendInvite=>inputoutput: Send invite
signUpForm=>inputoutput: #UJ Sign up form
signedIn=>inputoutput: Signed in
slideShowPopUp=>inputoutput: #UJ Slide Share Pop Up
simpleMessage=>condition: Writes & submits simple message
successMessage=>inputoutput: Success message
todo=>inputoutput: #TODO!!
togglePrivate=>condition: Toggle private
toogles=>inputoutput: Toggles
validEmail=>condition: Valid email
viewMyLookBook=>inputoutput: #UJ Manage my Look Book
viewsContentIndex=>inputoutput: #UJ Views Content Index
viewsContent=>inputoutput: #UJ Views Content
viewsComments=>inputoutput: #UJ View Comments
viewExsistingComments=>operation: View existing comments
viewOtherContentImages=>condition: View other content images
vote=>condition: Vote
voteAccepted=>inputoutput: Vote accepted
"""

VISITOR_UJS = [
  { title: "Get Inspired From Home",
    logic: """
st=>start: /home:>
#{ VISITOR_DEFINITIONS }

st->clicksInspNav
clicksInspNav(yes, right)->clicksContentCategory
clicksInspNav(no)->clicksContentItem
clicksContentCategory(yes, right)->viewsContentIndex
clicksContentCategory(no)->e
clicksContentItem(yes, right)->viewsContent
clicksContentItem(no)->e
    """
   },
  { title: "Views Content Index",
    logic: """
st=>start: /content/cat:>
#{ VISITOR_DEFINITIONS }

st->scrollsDown
scrollsDown(yes, right)->moreContentLoaded
scrollsDown(no)->clicksContent
moreContentLoaded->clicksContent
clicksContent(yes, right)->viewsContent
clicksContent(no)->e
    """
  },
  { title: "Views Content (Editorial)",
    logic: """
st=>start: /content/cat/#:>
#{ VISITOR_DEFINITIONS }

st->clicksImage->readsContent
clicksImage(yes, right)->slideShowPopUp
clicksImage(no)->readsContent
readsContent(yes, right)->finishesContent
readsContent(no)->addsToLookBook
addsToLookBook(yes, right)->successMessage
addsToLookBook(no)->e
finishesContent(yes, right)->clicksContentItem
finishesContent(no)->e
clicksContentItem(yes, right)->viewsContent
clicksContentItem(no)->scrollsDown
scrollsDown(yes, right)->moreContentLoaded
scrollsDown(no)->e2
    """
  },
  { title: "Views Content (Supplier)",
    logic: """
st=>start: /content/suppliers/#:>
#{ VISITOR_DEFINITIONS }

st->addsToLookBook
addsToLookBook(yes, right)->successMessage
addsToLookBook(no)->addedToXLookBooks
addedToXLookBooks(yes, right)->viewsContentIndex
addedToXLookBooks(no)->contactsSupplier
contactsSupplier(yes, right)->loggedIn
contactsSupplier(no)->requestsPhoneNumber
loggedIn(yes, right)->simpleMessage
loggedIn(no)->emailMessage
simpleMessage(yes, right)->messageSent
simpleMessage(no)->e
emailMessage->validEmail
validEmail(no, right)->emailMessage
validEmail(yes)->messageSent2
requestsPhoneNumber(yes, right)->phoneNumberShown
requestsPhoneNumber(no)->e
    """
  },
  { title: "Views Content (Look Book)",
    logic: """
st=>start: /look-books/#:>
#{ VISITOR_DEFINITIONS }

st->clicksVote
clicksVote(yes, right)->loggedIn
clicksVote(no)->copyLookBook
loggedIn(yes, right)->voteAccepted
loggedIn(no)->logInForm
copyLookBook(yes, right)->loggedIn2
loggedIn2(yes, right)->lookBookCopied
loggedIn2(no)->logInForm2
lookBookCopied->viewMyLookBook
copyLookBook(no)->clicksContentItem
clicksContentItem(yes, right)->viewsContent
clicksContentItem(no)->seeSimilarLookBooks
seeSimilarLookBooks(yes, right)->viewsContentIndex
seeSimilarLookBooks(no)->interactsWithComments
interactsWithComments(yes, right)->viewsComments
interactsWithComments(no)->e
    """
  },
  { title: "Manage my Look Book",
    logic: """
st=>start: /look-books/#:>
#{ VISITOR_DEFINITIONS }

editMyDetails=>condition: Edit my details
detailsEditor=>inputoutput: #UJ Details editor

st->editMyDetails
editMyDetails(yes, right)->detailsEditor
editMyDetails(no)->clicksContentItem
clicksContentItem(yes, right)->viewsContent
clicksContentItem(no)->togglePrivate
togglePrivate(yes, right)->toogles
togglePrivate(no)->removeItems
removeItems(yes, right)->itemsRemoved
removeItems(no)->interactsWithComments
interactsWithComments(yes, right)->viewsComments
interactsWithComments(no)->askFriendsToComment
askFriendsToComment(yes, right)->friendsInvited
askFriendsToComment(no)->addLink
addLink(yes, right)->linkAdded
addLink(no)->seeSimilarLookBooks
seeSimilarLookBooks(yes, right)->viewsContentIndex
seeSimilarLookBooks(no)->e
    """
  },
  { title: "View comments",
    logic: """
st=>start: Clicked on comments:>
#{ VISITOR_DEFINITIONS }

st->viewExsistingComments->loggedIn
loggedIn(yes, right)->vote
loggedIn(no)->logInForm
vote(yes, right)->voteAccepted
vote(no)->addComment
addComment(yes, right)->commentAccepted
addComment(no)->e
    """
  },
  { title: "Details editor",
    logic: """
st=>start: Details editor:>
#{ VISITOR_DEFINITIONS }

st->editDetails
editDetails(yes, right)->lookBookRepopulated
editDetails(no)->e
    """
    },
  { title: "Friends Invited",
    logic: """
st=>start: Invited friends to Look Book:>
#{ VISITOR_DEFINITIONS }

st->importedContacts
importedContacts(yes, right)->selectOneOrMoreFriends
importedContacts(no)->addFriendsEmail
selectOneOrMoreFriends(yes, right)->sendInvite->invitedToJoinLookBook
selectOneOrMoreFriends(no)->e
addFriendsEmail(yes, right)->sendInvite
addFriendsEmail(no)->e
    """
  },
  { title: "Slide Share Popup",
    logic: """
st=>start: Clicked content image:>
#{ VISITOR_DEFINITIONS }

st->navigateThroughImages
navigateThroughImages(yes, right)->viewOtherContentImages
navigateThroughImages(no)->addsToLookBook
addsToLookBook(yes, right)->successMessage
addsToLookBook(no)->interactsWithComments
interactsWithComments(yes, right)->viewsComments
interactsWithComments(no)->e
    """
  },
  { title: "Log in",
    logic: """
st=>start: /login:>
#{ VISITOR_DEFINITIONS }

st->alreadyAUser
alreadyAUser(yes, right)->clickForgotDetails
alreadyAUser(no)->clickSignUp
clickForgotDetails(yes, right)->forgotDetailsForm
clickForgotDetails(no)->fillInDetails->passValidation
clickSignUp(yes, right)->signUpForm
clickSignUp(no)->fillInDetails
passValidation(yes, right)->signedIn
passValidation(no)->fillInDetails
    """
  },
  { title: "Sign up form",
    logic: """
st=>start: Sign up form:>
#{ VISITOR_DEFINITIONS }

detailsValid=>condition: Details valid
reEnterDetails=>condition: Re enter details

st->detailsValid
detailsValid(yes, right)->viewMyLookBook
detailsValid(no)->reEnterDetails->detailsValid
    """
  },
  { title: "Invited to Join Look Book",
    logic: """
st=>start: Receive invite (email/FB etc):>
#{ VISITOR_DEFINITIONS }

acceptInvite=>condition: Accept invite
viewFriendsLookBook=>inputoutput: View friend's Look Book

st->acceptInvite
acceptInvite(yes, right)->viewFriendsLookBook
acceptInvite(no)->e
    """
  },
  { title: "Forgot Details Form",
    logic: """
st=>start: Forgot details form:>
#{ VISITOR_DEFINITIONS }

submitEmail=>operation: Submit email
emailBelongsToUser=>condition: Email belongs to existing user
changePasswordEmailSent=>inputoutput: Change password email sent

st->submitEmail->emailBelongsToUser
emailBelongsToUser(yes, right)->changePasswordEmailSent
emailBelongsToUser(no)->e
    """
  }
]