package fr.ensimag.deca.tree;

import fr.ensimag.deca.DecacCompiler;
import fr.ensimag.deca.context.ContextualError;

/**
 * Class declaration.
 *
 * @author gl01
 * @date 01/01/2024
 */
public abstract class AbstractDeclClass extends Tree {

        public abstract AbstractIdentifier getName();
        public abstract AbstractIdentifier getSupClass();
        public abstract ListDeclMethod getListDeclMethod();
        public abstract ListDeclField getListDeclField();


     /**
     * Pass 1 of [SyntaxeContextuelle]. Verify that the class declaration is OK
     * without looking at its content.
     */
    protected abstract void verifyClass(DecacCompiler compiler)
            throws ContextualError;

    /**
     * Pass 2 of [SyntaxeContextuelle]. Verify that the class members (fields and
     * methods) are OK, without looking at method body and field initialization.
     */
    protected abstract void verifyClassMembers(DecacCompiler compiler)
            throws ContextualError;

    /**
     * Pass 3 of [SyntaxeContextuelle]. Verify that instructions and expressions
     * contained in the class are OK.
     */
    protected abstract void verifyClassBody(DecacCompiler compiler)
            throws ContextualError;

        protected abstract void codeGenClass(DecacCompiler compiler);

        public abstract void codeGenInitField(DecacCompiler compiler);

}
