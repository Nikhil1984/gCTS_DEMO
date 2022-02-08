CLASS cl_quickfix_evaluation_obj DEFINITION ABSTRACT PUBLIC CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES:
      if_quickfix_evaluation FINAL METHODS evaluate,
      if_qfix_proposal_provider abstract methods create_proposals.
