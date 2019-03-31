<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 17:09
 */

namespace Stopka\MediaFactory\Model\Database\Entities;

use Doctrine\ORM\Mapping as ORM;

/**
 * Class MultiSelectFieldValueEntity
 * @package Stopka\MediaFactory\Model\Database\Entities\FieldValues
 * @ORM\Entity()
 */
class SingleSelectFieldValueEntity extends SelectFieldValueEntity
{
    public function selectOption(SelectOptionEntity $option): void
    {
        /** @var OptionSelectionEntity $selection */
        $selection = $this->optionSelections->first();
        if ($selection && $selection->getSelectOption()->getId()->equals($option->getId())) {
            return;
        }
        $this->clearOptionSelection();
        parent::selectOption($option);
    }

}
