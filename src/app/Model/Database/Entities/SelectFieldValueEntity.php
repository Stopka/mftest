<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 31.3.19
 * Time: 16:04
 */

namespace Stopka\MediaFactory\Model\Database\Entities;


use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Class SelectFieldValueEntity
 * @package Stopka\MediaFactory\Model\Database\Entities\FieldValues
 * @ORM\Entity()
 */
class SelectFieldValueEntity extends FieldValueEntity
{
    /**
     * @var OptionSelectionEntity[]|ArrayCollection
     * @ORM\OneToMany(targetEntity="OptionSelectionEntity",mappedBy="selectFieldValue", cascade={"all"}, orphanRemoval=true, indexBy="selectOption")
     */
    protected $optionSelections;

    public function __construct(SelectFieldEntity $field)
    {
        parent::__construct($field);
        $this->optionSelections = new ArrayCollection();
    }

    /**
     * @return SelectOptionEntity[]
     */
    public function getSelectedOptions(): array
    {
        $result = [];
        foreach ($this->optionSelections as $optionSelection) {
            $result[] = $optionSelection->getSelectOption();
        }
        return $result;
    }

    public function countSelectedOptions(): int
    {
        return $this->optionSelections->count();
    }

    public function selectOption(SelectOptionEntity $option): void
    {
        if (!$this->getField()->getId()->equals($option->getSelectField()->getId())) {
            return;
        }
        if ($this->optionSelections->containsKey($option->getId()->getBytes())) {
            return;
        }
        $selection = new OptionSelectionEntity($this, $option);
        $this->optionSelections->set($option->getId()->getBytes(), $selection);
    }

    public function unselectOption(SelectOptionEntity $option): void
    {
        $this->optionSelections->remove($option->getId()->getBytes());
    }

    public function clearOptionSelection(): void
    {
        $this->optionSelections->clear();
    }
}
