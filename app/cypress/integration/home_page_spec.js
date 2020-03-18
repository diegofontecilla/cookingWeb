describe('The Home Page', function () {
    it('successfully loads', function () {
        cy.visit('/')
    })

    it('h1 element corresponds', function () {
        cy.get('h1').should('contain', 'click & cook')
    })

    it('has submit button', function () {
        cy.get('[type="submit"]')
    })
})