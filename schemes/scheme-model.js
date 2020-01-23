const db = require( '../data/db-config' );

module.exports = {
    find,
    findById,
    findSteps,
    add,
    addStep,
    update,
    remove
}

function find () {
    return db.select( '*' ).from( 'schemes' );
}

function findById ( id ) {
    return db.select( '*' ).from( 'schemes' ).where( { id } ).first();
}

function findSteps ( id ) {
    return db( 'steps' ).join( 'schemes', 'steps.scheme.id', 'scheme.id' ).where( { scheme_id: id } ).select( 'scheme.scheme_name', 'steps.step_number', 'steps.instructions' ).orderBy( 'steps.step_number' );
}

function add ( scheme ) {
    return db( 'schemes' ).insert( scheme ).then( ( [ id ] ) => {
        return findById( id );
    } )
}

function update ( changes, id ) {
    return db( 'schemes' ).where( { id } ).update( changes ).then( () => {
        return findById( id );
    } )
}

function remove ( id ) {
    return findById( id ).then( scheme => {
        return db( 'schemes' ).where( { id } ).del().then( () => {
            return scheme;
        } )
    } )
}